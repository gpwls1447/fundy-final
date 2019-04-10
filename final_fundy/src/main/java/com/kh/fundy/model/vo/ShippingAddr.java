package com.kh.fundy.model.vo;

public class ShippingAddr {
   
   private int shipAddrNo;
   private String shipAddrTag;
   private String shipAddrReceiver;
   private int zipCode;
   private String shipAddr;
   private String shipAddrDetail;
   private String phone;
   private String memberEmail;
   
   public ShippingAddr() {}

   public ShippingAddr(int shipAddrNo, String shipAddrTag, String shipAddrReceiver, int zipCode, String shipAddr,
         String shipAddrDetail, String phone, String memberEmail) {
      super();
      this.shipAddrNo = shipAddrNo;
      this.shipAddrTag = shipAddrTag;
      this.shipAddrReceiver = shipAddrReceiver;
      this.zipCode = zipCode;
      this.shipAddr = shipAddr;
      this.shipAddrDetail = shipAddrDetail;
      this.phone = phone;
      this.memberEmail = memberEmail;
   }

   public int getShipAddrNo() {
      return shipAddrNo;
   }

   public void setShipAddrNo(int shipAddrNo) {
      this.shipAddrNo = shipAddrNo;
   }

   public String getShipAddrTag() {
      return shipAddrTag;
   }

   public void setShipAddrTag(String shipAddrTag) {
      this.shipAddrTag = shipAddrTag;
   }

   public String getShipAddrReceiver() {
      return shipAddrReceiver;
   }

   public void setShipAddrReceiver(String shipAddrReceiver) {
      this.shipAddrReceiver = shipAddrReceiver;
   }

   public int getZipCode() {
      return zipCode;
   }

   public void setZipCode(int zipCode) {
      this.zipCode = zipCode;
   }

   public String getShipAddr() {
      return shipAddr;
   }

   public void setShipAddr(String shipAddr) {
      this.shipAddr = shipAddr;
   }

   public String getShipAddrDetail() {
      return shipAddrDetail;
   }

   public void setShipAddrDetail(String shipAddrDetail) {
      this.shipAddrDetail = shipAddrDetail;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getMemberEmail() {
      return memberEmail;
   }

   public void setMemberEmail(String memberEmail) {
      this.memberEmail = memberEmail;
   }

   @Override
   public String toString() {
      return "ShippingAddr [shipAddrNo=" + shipAddrNo + ", shipAddrTag=" + shipAddrTag + ", shipAddrReceiver="
            + shipAddrReceiver + ", zipCode=" + zipCode + ", shipAddr=" + shipAddr + ", shipAddrDetail="
            + shipAddrDetail + ", phone=" + phone + ", memberEmail=" + memberEmail + "]";
   }

   
}