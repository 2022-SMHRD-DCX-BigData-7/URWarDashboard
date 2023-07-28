package com.smhrd.domain;

//newscmt.java

import java.util.Date;

public class newscmt {
 private int cmt_seq;
 private int news_seq;
 private String cmt_content;
 private Date cmt_at;
 private String id;

 public newscmt() {
     // 기본 생성자
 }

 public newscmt(int cmt_seq, int news_seq, String cmt_content, Date cmt_at, String id) {
     this.cmt_seq = cmt_seq;
     this.news_seq = news_seq;
     this.cmt_content = cmt_content;
     this.cmt_at = cmt_at;
     this.id = id;
 }

 // Getter, Setter 메서드
 public int getCmt_seq() {
     return cmt_seq;
 }

 public void setCmt_seq(int cmt_seq) {
     this.cmt_seq = cmt_seq;
 }

 public int getNews_seq() {
     return news_seq;
 }

 public void setNews_seq(int news_seq) {
     this.news_seq = news_seq;
 }

 public String getCmt_content() {
     return cmt_content;
 }

 public void setCmt_content(String cmt_content) {
     this.cmt_content = cmt_content;
 }

 public Date getCmt_at() {
     return cmt_at;
 }

 public void setCmt_at(Date cmt_at) {
     this.cmt_at = cmt_at;
 }

 public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }
}

