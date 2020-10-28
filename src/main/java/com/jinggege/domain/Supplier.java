package com.jinggege.domain;

public class Supplier {
    private String supplier;
    private String contacts;
    private String address;
    private String phone;

    @Override
    public String toString() {
        return "Supplier{" +
                "supplier='" + supplier + '\'' +
                ", contacts='" + contacts + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
