package dao;

import entity.CardInfo;
import util.DBhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class cardDao {

    /**
     * 预置一个注册银行卡的方法,需要生成卡号,用户id
     * @param card
     */
    public void addCard(CardInfo card) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        String sql = " insert cardinfo values(?,null,0,0,10,null,null,0,?); ";
        try {
             conn = DBhelper.getConnection();
             ps=conn.prepareStatement(sql);
            ps.setString(1, card.getCardId());
            ps.setInt(2, card.getCustomerId());
            ps.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }

    }

    //通过CardID查询Card
    public CardInfo getCardById(String id) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        CardInfo card = new CardInfo();
        String sql = "select * from cardinfo where card_id="+id;
        System.out.println(sql);
        try {
             conn= DBhelper.getConnection();
             ps = conn.prepareStatement(sql);
             rs = ps.executeQuery();
            while(rs.next()){
                card.setCardId(rs.getString(1));
                card.setCurType(rs.getString(2));
                card.setSavingType(rs.getBoolean(3));
                card.setMoney(rs.getString(4));
                card.setPrestore(rs.getInt(5));
                card.setPassword(rs.getString(6));
                card.setOpenDate(rs.getTimestamp(7));
                card.setReportLoss(rs.getBoolean(8));
                card.setCustomerId(rs.getInt(9));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }
        return card;
    }

    //金额的修改（取款，转账）   UPDATE cardinfo set money=11000 WHERE card_id = '6100700240001078666';
    public void updateCard_money(CardInfo card) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        String sql="update cardinfo set money=? where card_id=?";
        try {
             conn=DBhelper.getConnection();
             ps = conn.prepareStatement(sql);
            ps.setString(1, card.getMoney());
            ps.setString(2, card.getCardId());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }
    }

    //密码的修改
    public void updateCard_pwd(CardInfo card) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        String sql="update cardinfo set password=? where card_id=?";
        try {
             conn=DBhelper.getConnection();
             ps = conn.prepareStatement(sql);
            ps.setString(1, card.getPassword());
            ps.setString(2, card.getCardId());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }

    }
}
