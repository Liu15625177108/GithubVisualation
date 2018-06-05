package com.example.model;

public class repository {
    private int id;
    private String name;
    private int star;
    private  int fork;
    private  String url;
    private  String language;

    public repository(){}
    public repository(int id, String name, int star, String url, String language) {
        this.id = id;
        this.name = name;
        this.star = star;
        this.url = url;
        this.language = language;
    }

    public int getFork() {
        return fork;
    }

    public void setFork(int fork) {
        this.fork = fork;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getStar() {
        return star;
    }

    public String getUrl() {
        return url;
    }

    public String getLanguage() {
        return language;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
}
