package com.smhrd.domain;

import java.util.Date;

public class donate {
    private int donateSeq;      // 후원 번호
    private String id;          // 후원자 아이디
    private int donateSum;      // 후원금액
    private Date createdAt;     // 후원 날짜
    private int donatePoint;    // 적립된 포인트
    
    
	public int getDonateSeq() {
		return donateSeq;
	}
	public void setDonateSeq(int donateSeq) {
		this.donateSeq = donateSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDonateSum() {
		return donateSum;
	}
	public void setDonateSum(int donateSum) {
		this.donateSum = donateSum;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public int getDonatePoint() {
		return donatePoint;
	}
	public void setDonatePoint(int donatePoint) {
		this.donatePoint = donatePoint;
	}
    
    // toString 메서드
    @Override
    public String toString() {
        return "Donate{" +
                "donateSeq=" + donateSeq +
                ", id='" + id + '\'' +
                ", donateSum=" + donateSum +
                ", createdAt=" + createdAt +
                ", donatePoint=" + donatePoint +
                '}';
    }
}
