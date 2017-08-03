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
public class CommentBean {
    private String bus_number;
    private String description;
    private String remark; 
    private String email_id;
    private String comment_date;
    /**
     * @return the bus_number
     */
    public String getBus_number() {
        return bus_number;
    }

    /**
     * @param bus_number the bus_number to set
     */
    public void setBus_number(String bus_number) {
        this.bus_number = bus_number;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the email_id
     */
    public String getEmail_id() {
        return email_id;
    }

    /**
     * @param email_id the email_id to set
     */
    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    /**
     * @return the comment_date
     */
    public String getComment_date() {
        return comment_date;
    }

    /**
     * @param comment_date the comment_date to set
     */
    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

}
