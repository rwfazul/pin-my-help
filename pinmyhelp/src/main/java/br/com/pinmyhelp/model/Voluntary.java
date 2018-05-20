package br.com.pinmyhelp.model;
// Generated 17/05/2018 15:02:51 by Hibernate Tools 4.3.1


import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Voluntary generated by hbm2java
 */
@Entity
@Table(name="voluntary",catalog="pinmyhelp")
public class Voluntary extends Person{

    
    private List<Disponibility> disponibilities = new ArrayList<>();

    public Voluntary() {
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="voluntary")
    public List<Disponibility> getDisponibilities() {
        return this.disponibilities;
    }
    
    public void setDisponibilities(List<Disponibility> disponibilities) {
        this.disponibilities = disponibilities;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="voluntary")
    public List<Help> getHelps() {
        return this.helps;
    }
    
    @OneToMany(fetch=FetchType.LAZY, mappedBy="voluntary")
    public List<Feedback> getFeedbacks() {
        return this.feedbacks;
    }
    
}


