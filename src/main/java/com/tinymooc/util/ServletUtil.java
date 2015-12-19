package com.tinymooc.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Spring side, get the info of Servlet, such as request, HTTP session
 * 
 * @author Nordy
 */
public class ServletUtil {

    /**
     * get an object in Session
     * 
     * @param name
     *            name of the object
     * @param clazz
     *            Class of the Object
     * @return the object, null if the object not in session or can not cast to given class
     */
    public static <T> T getBeanInSession(String name, Class<T> clazz) {
        try {
            return clazz.cast(getSession().getAttribute(name));
        }
        catch (Exception e) {
            return null;
        }
    }

    /**
     * get the HttpRequest
     * 
     * @return
     */
    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder
                .currentRequestAttributes()).getRequest();
    }
    
    

    /**
     * get the HttpRequestParameter
     * 
     * @return
     */
    public static String getRequestParameter(String name) {
        return getRequest().getParameter(name);
    }

    /**
     * get the HttpRequestParameters
     * 
     * @return
     */
    public static String[] getRequestParameters(String name) {
        return getRequest().getParameterValues(name);
    }

    /**
     * get the HTTP Session
     * 
     * @return
     */
    public static HttpSession getSession() {
        return getRequest().getSession(true);
    }

    /**
     * get the HTTP Session
     * 
     * @param bool
     * @return
     */
    public static HttpSession getSession(boolean bool) {
        return getRequest().getSession(bool);
    }

    /**
     * put an object to Session
     * 
     * @param name
     * @param value
     */
    public static void setBeanInSession(String name, Object value) {
        getSession().setAttribute(name, value);
    }

    /**
     * set Object to HttpRequestAttribute
     * 
     * @param key
     * @param value
     */
    public static void setRequestAttribute(String key, Object value) {
        getRequest().setAttribute(key, value);
    }
}
