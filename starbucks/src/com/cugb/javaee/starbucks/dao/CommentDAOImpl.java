package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.CommentItem;
import com.cugb.javaee.starbucks.bean.Dish;

public class CommentDAOImpl extends baseDAO implements CommentDAO {

	@Override
	public int addComment(CommentItem comment) throws SQLException {
		String sql = "insert into comment(commentid,username, dishid, time, commenttext) values (?, ?, ?, ?, ?);";
		Object[] params = {comment.getCommentid(),comment.getUsername(),comment.getDishid(),comment.getTime(),comment.getCommenttext()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeComment(int commentid) throws SQLException {
		String sql = "delete from comment where commentid = ?";
		Object[] params = {commentid};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyComment(CommentItem comment) throws SQLException {
		String sql = "update comment set username = ?,dishid = ? , time = ?, commenttext = ? where commentid = ?";
		Object[] params = {comment.getUsername(),comment.getDishid(),comment.getTime(), comment.getCommenttext(), comment.getCommentid()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findComments(int dishid) throws SQLException {
		String sql = "select commentid Commentid, dishid Dishid,username Username,time Time, commenttext Commenttext from comment where dishid=?";
		Object[] params = {dishid};
		return findObjs(sql, params,CommentItem.class);
	}

	@Override
	public CommentItem findComment(int commentid) throws SQLException {
		String sql = "select commentid Commentid,username Username, dishid Dishid,time Time, commenttext Commenttext from comment where commentid = ?";
		Object[] params = {commentid};
		return (CommentItem) findObj(sql, params,  CommentItem.class);
	}

}
