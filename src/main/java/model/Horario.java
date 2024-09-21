package model;

import java.sql.Time;

public class Horario {
    Long id;
    Time hInicio;
    Time hFin;

    public Horario() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Time gethInicio() {
        return hInicio;
    }

    public void sethInicio(Time hInicio) {
        this.hInicio = hInicio;
    }

    public Time gethFin() {
        return hFin;
    }

    public void sethFin(Time hFin) {
        this.hFin = hFin;
    }
    public  void getHorariosDis(){
        
    }
}
