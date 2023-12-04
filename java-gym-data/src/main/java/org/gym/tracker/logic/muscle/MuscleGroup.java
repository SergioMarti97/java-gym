package org.gym.tracker.logic.muscle;

import org.gym.tracker.logic.AbstractGymElement;

import java.util.ArrayList;
import java.util.List;

public class MuscleGroup extends AbstractGymElement {

    protected List<Muscle> muscles = new ArrayList<>();

    public MuscleGroup() {
    }

    public MuscleGroup(int id, String name) {
        super(id, name);
    }

    public List<Muscle> getMuscles() {
        return muscles;
    }

}
