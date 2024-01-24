/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class VerifyCode {
    private String code;
    private long expiredTime;

    public VerifyCode() {
    }

    public VerifyCode(String code, long expiredTime) {
        this.code = code;
        this.expiredTime = expiredTime;
    }

    public String getCode() {
        return code;
    }

    public long getExpiredTime() {
        return expiredTime;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setExpiredTime(long expiredTime) {
        this.expiredTime = expiredTime;
    }
    
}
