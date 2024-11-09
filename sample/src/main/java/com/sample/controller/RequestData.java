package com.sample.controller;

public class RequestData {
    private int id;
    private String username;
    private String softwareName;
    private String accessType;
    private String reason;

    public RequestData(int id, String username, String softwareName, String accessType, String reason) {
        this.id = id;
        this.username = username;
        this.softwareName = softwareName;
        this.accessType = accessType;
        this.reason = reason;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSoftwareName() {
		return softwareName;
	}

	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}

	public String getAccessType() {
		return accessType;
	}

	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

    // Getters and setters
}

