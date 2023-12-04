package org.gym.tracker.logic.workout;

import org.gym.tracker.logic.AbstractGymElement;
import org.gym.tracker.logic.exercise.Exercise;

public class Series extends AbstractGymElement {

    /**
     * The exercise of this set
     */
    protected Exercise exercise;

    /**
     * Number of reps
     */
    protected int reps;

    /**
     * The weight of the exercise
     */
    protected float weight;

    /**
     * The duration of the exercise
     */
    protected float duration;

    /**
     * The duration of the rest
     */
    protected float rest;

    /**
     * RIR = Reps In Reserve, Repeticiones En Recámara
     */
    protected int rir;

    // Constructors

    public Series() {
    }

    public Series(int id, String name, Exercise exercise, int reps, float weight) {
        super(id, name);
        this.exercise = exercise;
        this.reps = reps;
        this.weight = weight;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public float getRest() {
        return rest;
    }

    public void setRest(float rest) {
        this.rest = rest;
    }

    public int getRir() {
        return rir;
    }

    public void setRir(int rir) {
        this.rir = rir;
    }

}
