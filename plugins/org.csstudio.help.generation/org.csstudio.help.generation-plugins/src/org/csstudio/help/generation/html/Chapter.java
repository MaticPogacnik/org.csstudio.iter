package org.csstudio.help.generation.html;

import java.util.LinkedList;
import java.util.List;

public class Chapter {
	private String path;
	private String charset;
	private String name;
	private List < Chapter > subChapter;
	public Chapter(String path, String name, String charset) {
		super();
		this.path = path;
		this.name = name;
		this.charset = charset;
		subChapter = new LinkedList<Chapter>();
	}
	public String getPath() {
		return path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public List<Chapter> getSubChapter() {
		return subChapter;
	}
	public void setSubChapter(List<Chapter> subChapter) {
		this.subChapter = subChapter;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
}