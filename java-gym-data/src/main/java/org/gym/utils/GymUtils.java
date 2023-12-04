package org.gym.utils;

public class GymUtils {

    /*
    *     public static void generateInsertsScript() {
        Connection con = new MySQLConnectionUtils("C:\\Users\\Sergio\\IdeaProjects\\java-gym\\java-gym-data\\app.properties").getConnection();
        ExerciseDAO dao = new ExerciseDAO(con);

        QueryBuilder b = new QueryBuilder("Exercise", "id", "name", "img_path");
        String insert = b.buildQueryInsert();
        PreparedStatement ps = MySQLDatabaseUtils.getPreparedStatement(con, insert);

        for (var exercise : dao.readAll()) {
            try {
                assert ps != null;
                ps.setString(1, exercise.getName());
                ps.setString(2, exercise.getImgPath());
            } catch (SQLException exception) {
                System.out.println("Error: " + exception.getMessage());
            }
            String out = ps.toString();
            out = out.replace("com.mysql.cj.jdbc.ClientPreparedStatement: ", "");
            System.out.println(out);
        }

        try {
            dao.getCon().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        generateInsertsScript();
    }
    */
}
