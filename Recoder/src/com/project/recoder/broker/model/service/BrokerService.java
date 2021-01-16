package com.project.recoder.broker.model.service;

import com.project.recoder.broker.model.dao.BrokerDAO;
import com.project.recoder.broker.model.vo.Broker;
import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;

public class BrokerService {
	
	BrokerDAO dao = new BrokerDAO();
	/** 공인중개사 회원 로그인 Service
	 * @param broker
	 * @return LoginBroker
	 * @throws Exception
	 */
	public Broker loginBroker(Broker broker) throws Exception{
		Connection conn = getConnection();
		
		Broker loginBroker = dao.loginBroker(broker, conn);
		
		close(conn);
		
		return loginBroker;
	}

}
