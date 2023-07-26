package com.example.customer_support_ip.beans;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Getter
@Setter

@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class UserBean implements Serializable {

    private Integer id;
    private String ime;
    private String prezime;
    private String korisnicko_ime;
    private String lozinka;


    public UserBean() {

    }

    public UserBean(Integer id, String ime, String prezime, String korisnicko_ime, String lozinka) {
        this.id = id;
        this.ime = ime;
        this.prezime = prezime;
        this.korisnicko_ime = korisnicko_ime;
        this.lozinka = lozinka;

    }
}