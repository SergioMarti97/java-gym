package org.gym.tracker.logic.workout;

import org.gym.tracker.logic.AbstractGymElement;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class Workout extends AbstractGymElement {

    /**
     * The workout
     */
    protected List<SeriesBlock> series;

    /**
     * The date when the workout was done
     */
    protected LocalDate date;

    /**
     * Start time
     */
    protected LocalTime start = null;

    /**
     * End time
     */
    protected LocalTime end = null;

    // Constructors

    public Workout() {
    }

    public Workout(int id, String name, LocalDate date) {
        super(id, name);
        this.date = date;
    }

    // Getters & Setters

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getStart() {
        return start;
    }

    public void setStart(LocalTime start) {
        this.start = start;
    }

    public LocalTime getEnd() {
        return end;
    }

    public void setEnd(LocalTime end) {
        this.end = end;
    }

    public List<SeriesBlock> getSeries() {
        return series;
    }

    public int getNumExercises() {
        return series.size();
    }

}
