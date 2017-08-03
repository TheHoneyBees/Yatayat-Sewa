/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

/**
 *
 * @author boude
 */
public class Board_PointBean {
    private String bpname;
    private String time;

    public Board_PointBean(String bpname, String time) {
        this.bpname = bpname;
        this.time = time;
    }

    /**
     * @return the bpname
     */
    public String getBpname() {
        return bpname;
    }

    /**
     * @param bpname the bpname to set
     */
    public void setBpname(String bpname) {
        this.bpname = bpname;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
    }
    
}
