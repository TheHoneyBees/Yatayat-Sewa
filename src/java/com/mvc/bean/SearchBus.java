package com.mvc.bean;

public class SearchBus {
    private String bus_number;
	private String from_address;
	 private String to_address;
	 private String date;
         private String time;
         private String name;
	 private String travel_type;
         private int fare;
         private int seats;
         private int scheduleid=0;
         private int routeid=0;
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
     * @return the from_address
     */
    public String getFrom_address() {
        return from_address;
    }

    /**
     * @param from_address the from_address to set
     */
    public void setFrom_address(String from_address) {
        this.from_address = from_address;
    }

    /**
     * @return the to_address
     */
    public String getTo_address() {
        return to_address;
    }

    /**
     * @param to_address the to_address to set
     */
    public void setTo_address(String to_address) {
        this.to_address = to_address;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
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

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
    public int getFare() {
        return fare;
    }

    /**
     * @param fare the fare to set
     */
    public void setFare(int fare) {
        this.fare = fare;
    }

    /**
     * @return the seats
     */
    public int getSeats() {
        return seats;
    }

    /**
     * @param seats the seats to set
     */
    public void setSeats(int seats) {
        this.seats = seats;
    }

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
     * @return the routeid
     */
    public int getRouteid() {
        return routeid;
    }

    /**
     * @param routeid the routeid to set
     */
    public void setRouteid(int routeid) {
        this.routeid = routeid;
    }
	 
	
	 

}
