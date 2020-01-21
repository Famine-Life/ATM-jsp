package dao;

import entity.TransInfo;
import util.DBhelper;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class transDao {

    /**
     * 根据id返回所有转账记录
     * @return
     */
    public List<TransInfo> getTransList(String card_id) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        List<TransInfo> transList=new ArrayList<TransInfo>();
        String sql = "select * from transinfo where card_id = ?;";
        try{
             conn = DBhelper.getConnection();
             ps = conn.prepareStatement(sql);
            ps.setString(1,card_id);
             rs = ps.executeQuery();
            while(rs.next()){
                TransInfo trans = new TransInfo();
                String cardID = rs.getString(1);
                Integer trans_type = rs.getInt(2);
                Integer trans_money = rs.getInt(3);
                Timestamp trans_date = rs.getTimestamp(4);
                String remark = rs.getString(5);
                trans.setCardId(cardID);
                trans.setTransType(trans_type);
                trans.setTransMoney(trans_money);
                trans.setTransDate(trans_date);
                trans.setRemark(remark);
                transList.add(trans);
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }
        return transList;
    }


}
