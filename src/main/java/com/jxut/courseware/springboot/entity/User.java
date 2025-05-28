package com.jxut.courseware.springboot.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String username;
    private String password;
    private String realname;
    private String sex;
    private String address;
    private String tel;
    private String type;
    private String birthday;
    private String if_valid;
}
