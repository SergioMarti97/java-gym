package org.gym.tracker.dao.exercise;

import org.gym.tracker.logic.exercise.Exercise;
import org.simple.db.mysql.MySQLGenericDAO;
import org.simple.db.mysql.query.QueryBuilder;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ExerciseDAO extends MySQLGenericDAO<Exercise> {


    public ExerciseDAO(Connection con) {
        this.con = con;
        queryBuilder = new QueryBuilder(
                "Exercise",
                "id",
                "name",
                "brief_description",
                "img_path",
                "id_parent");
    }

    @Override
    public boolean insert(Exercise exercise) {
        return false;
    }

    @Override
    public Exercise read(int i) {
        return null;
    }

    @Override
    public List<Exercise> readAll() {
        return null;
    }

    @Override
    public boolean update(Exercise exercise) {
        return false;
    }

    @Override
    public boolean delete(int i) {
        return false;
    }

    @Override
    public Exercise build(ResultSet rs) {
        try {
            var exercise = new Exercise(
                    rs.getInt(queryBuilder.getIdField()),
                    rs.getString(queryBuilder.getFields().get(0)),
                    rs.getString(queryBuilder.getFields().get(1)),
                    rs.getString(queryBuilder.getFields().get(2))
            );

            return exercise;
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return null;
    }

}
