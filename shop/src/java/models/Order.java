
package models;

import java.time.LocalDate;

public class Order {
    private int id;
    private LocalDate date;
    private User user;
    private int totalmoney;
    private int status;

    public Order() {
    }

    public Order(LocalDate date, User user, int totalmoney, int status) {
        this.date = date;
        this.user = user;
        this.totalmoney = totalmoney;
        this.status = status;
    }
    
    public Order(int id, LocalDate date, User user, int totalmoney, int status) {
        this.id = id;
        this.date = date;
        this.user = user;
        this.totalmoney = totalmoney;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", date=" + date + ", user=" + user + ", totalmoney=" + totalmoney + ", status=" + status + '}';
    }
    
    
    
}
