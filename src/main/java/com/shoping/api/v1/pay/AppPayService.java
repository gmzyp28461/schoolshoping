package com.shoping.api.v1.pay;

import com.shoping.project.shop.domain.MineOrder;
import com.shoping.project.system.user.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

/**
 * @ClassName AppPayService
 * @Description:
 * @Author javac
 * @Date 2021/4/17
 **/
public interface AppPayService {

    public Map<String, Object> createOrder(OrderForm orderForm, WxPayConfig config, User user,User disUser) throws Exception;

    public  String notify(HttpServletRequest request, HttpServletResponse response,WxPayConfig config) throws Exception;

    public  int refunds(MineOrder mineOrder, WxPayConfig config, BigDecimal price) throws IOException;


}
