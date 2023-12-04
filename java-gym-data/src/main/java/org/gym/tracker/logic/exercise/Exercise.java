package org.gym.tracker.logic.exercise;

import org.gym.tracker.logic.AbstractGymElement;
import org.gym.tracker.logic.muscle.Muscle;
import org.gym.tracker.logic.muscle.MuscleGroup;

import java.util.ArrayList;
import java.util.List;

public class Exercise extends AbstractGymElement {

    protected String briefDescription;

    protected String imgPath;

    protected Exercise parent = null;

    protected List<Muscle> muscles = new ArrayList<>();

    protected List<MuscleGroup> muscleGroups = new ArrayList<>();

    public Exercise() {
    }

    public Exercise(int id, String name, String briefDescription, String imgPath) {
        super(id, name);
        this.briefDescription = briefDescription;
        this.imgPath = imgPath;
    }

    public String getBriefDescription() {
        return briefDescription;
    }

    public String getImgPath() {
        return imgPath;
    }

    public Exercise getParent() {
        return parent;
    }

    public List<Muscle> getMuscles() {
        return muscles;
    }

    public List<MuscleGroup> getMuscleGroups() {
        return muscleGroups;
    }

    public void setBriefDescription(String briefDescription) {
        this.briefDescription = briefDescription;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public void setParent(Exercise parent) {
        this.parent = parent;
    }

}
