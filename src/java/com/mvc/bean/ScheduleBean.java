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
public class ScheduleBean {
    private int scheduleid;
    private String bus_name;
    private String bus_number;
    private String departure_date;
    private String departure_time;
    private String departure;
    private String destination;
    private String destination_time;
    private String travel_type;
    private String fare = "0";
    private String available_seats = "0";
    private String total_seats = "0";

    /**
     * @return the scheduleid
     */
    public int getScheduleid() {
        return scheduleid;
    }

    /**
     * @param scheduleid the scheduleid to set
     */
    public void setScheduleid(int scheduleid) {
        this.scheduleid = scheduleid;
    }

    /**
     * @return the bus_name
     */
    public String getBus_name() {
        return bus_name;
    }

    /**
     * @param bus_name the bus_name to set
     */
    public void setBus_name(String bus_name) {
        this.bus_name = bus_name;
    }

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
     * @return the departure_date
     */
    public String getDeparture_date() {
        return departure_date;
    }

    /**
     * @param departure_date the departure_date to set
     */
    public void setDeparture_date(String departure_date) {
        this.departure_date = departure_date;
    }

    /**
     * @return the departure_time
     */
    public String getDeparture_time() {
        return departure_time;
    }

    /**
     * @param departure_time the departure_time to set
     */
    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    /**
     * @return the departure
     */
    public String getDeparture() {
        return departure;
    }

    /**
     * @param departure the departure to set
     */
    public void setDeparture(String departure) {
        this.departure = departure;
    }

    /**
     * @return the destination
     */
    public String getDestination() {
        return destination;
    }

    /**
     * @param destination the destination to set
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * @return the destination_time
     */
    public String getDestination_time() {
        return destination_time;
    }

    /**
     * @param destination_time the destination_time to set
     */
    public void setDestination_time(String destination_time) {
        this.destination_time = destination_time;
    }

    /**
     * @return the travel_type
     */
    public String getTravel_type() {
        return travel_type;
    }

    /**
     * @param travel_type the travel_type to set
     */
    public void setTravel_type(String travel_type) {
        this.travel_type = travel_type;
    }

    /**
     * @return the fare
     */
    public String getFare() {
        return fare;
    }

    /**
     * @param fare the fare to set
     */
    public void setFare(String fare) {
        this.fare = fare;
    }

    /**
     * @return the available_seats
     */
    public String getAvailable_seats() {
        return available_seats;
    }

    /**
     * @param available_seats the available_seats to set
     */
    public void setAvailable_seats(String available_seats) {
        this.available_seats = available_seats;
    }

    /**
     * @return the total_seats
     */
    public String getTotal_seats() {
        return total_seats;
    }

    /**
     * @param total_seats the total_seats to set
     */
    public void setTotal_seats(String total_seats) {
        this.total_seats = total_seats;
    }
}
