package com.example.customer_support_ip.beans;

import java.io.Serializable;

import lombok.*;


@Getter
@Setter
@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class MessageBean implements Serializable {

    private Integer id;
    private String sadrzaj;
    private boolean procitana;
    private String email;
    private String avatar;

    public MessageBean() {

    }
    public MessageBean(Integer id, String sadrzaj, boolean procitana, String email) {
        this.id = id;
        this.sadrzaj = sadrzaj;
        this.procitana = procitana;
        this.email = email;
    }
}