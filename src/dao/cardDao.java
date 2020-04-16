package dao;

import entity.CardInfo;
import entity.UserInfo;
import util.DBhelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class cardDao {

    /**
     * 预置一个注册银行卡的方法,需要生成卡号,用户id
     * @param card
     */
    public void addCard(CardInfo card) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;

        String sql = " insert cardinfo values(?,"+"\'"+"default"+"\'"+",0,?,10,?,?,0,?); ";
        try {
             conn = DBhelper.getConnection();
             ps=conn.prepareStatement(sql);
            ps.setString(1, card.getCardId());
            ps.setString(2,card.getMoney());
            ps.setString(3,card.getPassword());
            ps.setTimestamp(4, (Timestamp) card.getOpenDate());
            ps.setInt(5, card.getCustomerId());
            ps.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }

    }

//    public static void main(String[] args) throws SQLException {
//        cardDao cardDao = new cardDao();
//        List<CardInfo> cardAll = cardDao.getCardAll();
//        for (CardInfo cardInfo:cardAll) {
//            System.out.println(cardInfo.toString());
//        }
//    }

    //返回所有的card
    public List<CardInfo> getCardAll() throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        List<CardInfo> cardList = new ArrayList<CardInfo>();
        String sql = "select * from cardinfo";
        System.out.println(sql);
        try {
            conn= DBhelper.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                CardInfo card = new CardInfo();
                card.setCardId(rs.getString(1));
                card.setCurType(rs.getString(2));
                card.setSavingType(rs.getBoolean(3));
                card.setMoney(rs.getString(4));
                card.setPrestore(rs.getInt(5));
                card.setPassword(rs.getString(6));
                card.setOpenDate(rs.getTimestamp(7));
                card.setReportLoss(rs.getBoolean(8));
                card.setCustomerId(rs.getInt(9));
                cardList.add(card);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }
        return cardList;
    }

    //通过CardID查询Card
    public CardInfo getCardById(String id) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        CardInfo card = new CardInfo();
        String sql = "select * from cardinfo where card_id=?";
        System.out.println(sql);
        try {
             conn= DBhelper.getConnection();
             ps = conn.prepareStatement(sql);
             ps.setString(1,id);
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
        System.out.println(card.toString());
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

    //更新card
    public void updateCard(CardInfo card) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        String sql="update cardinfo set password=?,money=? where card_id=?";
        try {
            conn=DBhelper.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, card.getPassword());
            ps.setString(2, card.getMoney());
            ps.setString(3, card.getCardId());
            System.out.println(sql);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }

    }

    //根据据id删除card
    public boolean deleteCard(String id) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBhelper.getConnection();
            String sql="delete from cardinfo where card_id=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1, id);
            result=ps.execute();
            //System.out.println(result); //execute()  true or false
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBhelper.closeConnection(rs,ps,conn);
        }
        return result;
    }
}
