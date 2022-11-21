package com.shoping.api.v1;

import com.shoping.common.utils.OrderUtils;
import com.shoping.common.utils.RedisCache;
import com.shoping.common.utils.StringUtils;
import com.shoping.common.utils.http.HttpUtils;
import com.shoping.common.utils.uuid.IdUtils;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.project.system.user.domain.User;
import com.shoping.project.system.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName UserController
 * @Description:
 * @Author javac
 * @Date 2021/11/11
 **/
@Api("用户信息")
@Controller
@RequestMapping("/app/v1/user")
public class AppUserController extends BaseController {


    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IUserService userService;

    @ApiOperation(value = "用户注册信息", notes = "用户注册信息")
    @PostMapping(value = "/getOpenid", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getOpenid(String code) {


        if (StringUtils.isEmpty(code)){
            return AjaxResult.error("登录凭证不能为空");
        }

        //小程序唯一标识   (在微信小程序管理后台获取)
        String wxspAppid ="wx5236078517d5d73f";
        //小程序的 app secret (在微信小程序管理后台获取)
        String wxspSecret = "5b6532e4895f0c34d10edb137ea4f461";
        //授权（必填）
        String grant_type = "authorization_code";
        //请求参数
        String params = "appid=" + wxspAppid + "&secret=" + wxspSecret + "&js_code=" + code + "&grant_type=" + grant_type;
        //发送请求
        String sr = HttpUtils.sendGet("https://api.weixin.qq.com/sns/jscode2session", params);

        //解析相应内容（转换成json对象）
        JSONObject json = JSONObject.fromObject(sr);
        //获取会话密钥（session_key）
        String session_key = json.get("session_key").toString();
        //用户的唯一标识（openid）
        String openid = (String) json.get("openid");


        String token = IdUtils.simpleUUID();
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("openid", openid);
        map.put("session_key", session_key);


        User user = new User();
        user.setOpenId(openid);
        List<User> userList = userService.selectUserList(user);

        if (userList == null||userList.size()==0) {
            return AjaxResult.warn("用户未注册",map);
        }
        redisCache.setCacheObject("user_" + token, userList.get(0), 30, TimeUnit.DAYS);

        return AjaxResult.success(map);
    }


    @ApiOperation(value = "用户注册信息", notes = "用户注册信息")
    @PostMapping(value = "/registerOrLogin", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult registerOrLogin(User user) {
        //判断用户openid是否注册，如果注册则直接登录
        //如果未注册则保存用户信息，再登录
        //存储token
        String token = IdUtils.simpleUUID();
        Map<String, String> map = new HashMap<>();
        map.put("token", token);

        User sysUser = new User();
        sysUser.setOpenId(user.getOpenId());
        List<User> userList = userService.selectUserList(sysUser);

        if (userList == null||userList.size()==0) {
            //如果用户为空，则需要注册
            user.setInviteCode(String.valueOf(OrderUtils.getRandom(6L)));
            userService.registerUser(user);
            redisCache.setCacheObject("user_" + token, user, 30, TimeUnit.DAYS);
        }else{
            redisCache.setCacheObject("user_" + token, userList.get(0), 30, TimeUnit.DAYS);
        }

        return AjaxResult.success("登录成功", map);
    }


    @ApiOperation(value = "用户详细信息", notes = "用户详细信息")
    @PostMapping(value = "/getUserInfo", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getUserInfo() {
        User user  = getCurrentAppUserToken();
        user = userService.selectUserById(user.getUserId());
        return AjaxResult.success(user);
    }

}
