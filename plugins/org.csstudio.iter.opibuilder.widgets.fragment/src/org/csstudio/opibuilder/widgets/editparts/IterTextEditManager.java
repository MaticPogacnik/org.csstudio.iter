package org.csstudio.opibuilder.widgets.editparts;

import org.csstudio.opibuilder.OPIBuilderPlugin;
import org.csstudio.opibuilder.editparts.AbstractBaseEditPart;
import org.csstudio.opibuilder.editparts.ExecutionMode;
import org.csstudio.opibuilder.editparts.IPVWidgetEditpart;
import org.eclipse.gef.tools.CellEditorLocator;
import org.eclipse.jface.viewers.CellEditor;
import org.eclipse.jface.viewers.TextCellEditor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.KeyEvent;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.widgets.Composite;

/**
 * An subclass of BOY's TextEditManager with support for ITER-specific behaviour and appearance.
 * Differences with the default TextEditManager:
 * 	- it can set a configurable background color (for the direct edit CellEditor) when the text input has focus
 *  - it can confirm (save) the value to the PV on focus loss (without pressing ENTER)
 *  
 *  It must be used together with TextInputStyledEditpart and TextInputStyledModel.
 *
 * @author Boris Versic
 *
 */
public class IterTextEditManager extends TextEditManager {
	
	private Color backgroundFocusColor;
	private boolean confirmOnFocusLost;

	/**
	 * @param backgroundFocusColor The color to be used for the CellEditor's background. If null, the Figure's background color is used.
	 * @param confirmOnFocusLost If true, the PV value will be saved on FocusLost, even without pressing ENTER.
	 */
	public IterTextEditManager(AbstractBaseEditPart source, CellEditorLocator locator, boolean multiline, Color backgroundFocusColor, boolean confirmOnFocusLost) {
		super(source, locator, multiline);
		
		this.backgroundFocusColor = backgroundFocusColor;
		this.confirmOnFocusLost = confirmOnFocusLost;
	}

	public IterTextEditManager(AbstractBaseEditPart source, CellEditorLocator locator, boolean multiline) {
		super(source, locator, multiline);

		this.backgroundFocusColor = null;
		this.confirmOnFocusLost = false;
	}

	public IterTextEditManager(AbstractBaseEditPart source, CellEditorLocator locator) {
		super(source, locator);
		
		this.backgroundFocusColor = null;
		this.confirmOnFocusLost = false;
	}

	@Override
	protected CellEditor createCellEditorOn(Composite composite) {
	    CellEditor editor =  new TextCellEditor(composite, (multiLine ? SWT.MULTI : SWT.SINGLE) | SWT.WRAP){
	        @Override
	        protected void focusLost() {
	            //in run mode, if the widget has a PV attached,
	            //lose focus should cancel the editing except mobile or when confirmOnFocusLost is set to true.
	                if (editPart.getExecutionMode() == ExecutionMode.RUN_MODE
	                        && !OPIBuilderPlugin.isMobile(getControl().getDisplay())
	                        && !confirmOnFocusLost
	                        && editPart instanceof IPVWidgetEditpart
	                        && ((IPVWidgetEditpart) editPart).getPV() != null) {
	                    if (isActivated()) {
	                        fireCancelEditor();
	                        deactivate();
	                    }
	                    editPart.getFigure().requestFocus();
	                } else
	                    super.focusLost();
	        }

	        @Override
	        protected void handleDefaultSelection(SelectionEvent event) {
	            //In run mode, hit ENTER should force to write the new value even it doesn't change.
	            if(editPart.getExecutionMode() == ExecutionMode.RUN_MODE) {
	                setDirty(true);
	            }
	            super.handleDefaultSelection(event);
	        }

	        @Override
	        protected void keyReleaseOccured(KeyEvent keyEvent) {
	            //In run mode, CTRL+ENTER will always perform a write if it is multiline text input
	            if (keyEvent.character == '\r' &&
	                    editPart.getExecutionMode() == ExecutionMode.RUN_MODE) { // Return key
	                if (text != null && !text.isDisposed()
	                        && (text.getStyle() & SWT.MULTI) != 0) {
	                    if ((keyEvent.stateMask & SWT.CTRL) != 0) {
	                      setDirty(true);
	                    }
	                }
	            }
	            super.keyReleaseOccured(keyEvent);
	        }
	    };
	    editor.getControl().moveAbove(null);
	    return editor;
	}
	
	@Override
	protected void initCellEditor() {
		super.initCellEditor();
		
		// override background color setting, but only in runMode
		if (editPart.getExecutionMode() == ExecutionMode.RUN_MODE && backgroundFocusColor != null)
			getCellEditor().getControl().setBackground(backgroundFocusColor);
	}

}