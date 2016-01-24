<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resource/jspf/commons.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>帮助中心 - 萌课网</title>
  <link rel="Shortcut Icon" href="<c:url value="/resource/pic/icon.ico" />" />
</head>

<body class="lily-theme">
<jsp:include page="/jsp/include/head2.jsp"></jsp:include>

<section class="content container" style="margin-top: 60px;">
<div class="container-padding clearfix">
  <div class="normal-main">
    <h1>帮助中心</h1>
    <div class="editor-content">
      <h2 id="help_user_fortune">学分和金币</h2>
      <div>
        <table width="98%">
          <tr><th>用户行为</th><th>学分</th><th>金币</th><th>备注</th></tr>
          <tr>
            <td>创建一个课程</td>
            <td>+ 100</td>
            <td>+ 50</td>
            <td>课程正式发布时，发放学分和金币</td>
          </tr>
          <tr>
            <td>课程被标志为原创</td>
            <td>+ 300</td>
            <td>+ 30</td>
            <td>&nbsp;</td>
          </tr>

          <tr>
            <td>课程被标志为精华</td>
            <td>+ 500</td>
            <td>+ 50</td>
            <td>&nbsp;</td>
          </tr>

          <tr>
            <td>课程被删除</td>
            <td>- 100</td>
            <td>- 50</td>
            <td>&nbsp;</td>
          </tr>

          <tr>
            <td>学习一课时</td>
            <td>+ 5</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>取消一课时的学习</td>
            <td>- 5</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>学完课程的全部课时</td>
            <td>+ 10</td>
            <td>&nbsp;</td> 
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>对课时评论</td>
            <td>+ 2</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>课时评论被删除</td>
            <td>- 2</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>对课程提问</td>
            <td>+ 5</td>
            <td>+ 1</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>对课程提问被删除</td>
            <td>- 5</td>
            <td>- 1</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>回答课程提问</td>
            <td>+ 5</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>回答被删除</td>
            <td>- 5</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>

          <tr>
            <td>创建小组</td>
            <td>+ 10</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>小组发表话题</td>
            <td>+ 3</td>
            <td>+ 1</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>小组回复话题</td>
            <td>+ 1</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>小组话题被删除</td>
            <td>- 3</td>
            <td>- 1</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>小组话题回复被删除</td>
            <td>- 1</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>小组被删除</td>
            <td>- 10</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>每邀请一个好友</td>
            <td>&nbsp;</td>
            <td>+ 2</td>
            <td>好友注册成功之后发放金币，如发现作弊则加倍扣除所得金币。</td>
          </tr>
          <tr>
            <td>完成任务</td>
            <td>n</td>
            <td>m</td>
            <td>获得任务奖励的相应n学分或者m金币。</td>
          </tr>
        </table>
      </div>
      
      <h2 id="help_user_level">用户等级表</h2>
      <table width="80%">
        <tr>
          <th>等级</th>
          <th>所需学分</th>
          <th>等级</th>
          <th>所需学分</th>
          <th>等级</th>
          <th>所需学分</th>
        </tr>
        <tr> <th>1</th>   <td>0</td>      <th>18</th> <td>6000</td>  <th>35</th> <td>72000</td> </tr>
        <tr> <th>2</th>   <td>30</td>     <th>19</th> <td>7500</td>  <th>36</th> <td>78000</td> </tr>
        <tr> <th>3</th>   <td>80</td>     <th>20</th> <td>9000</td>  <th>37</th> <td>84000</td> </tr>
        <tr> <th>4</th>   <td>120</td>    <th>21</th> <td>12000</td> <th>38</th> <td>90000</td> </tr>
        <tr> <th>5</th>   <td>150</td>    <th>22</th> <td>15000</td> <th>39</th> <td>96000</td> </tr>
        <tr> <th>6</th>   <td>200</td>    <th>23</th> <td>18000</td> <th>40</th> <td>102000</td> </tr>
        <tr> <th>7</th>   <td>250</td>    <th>24</th> <td>21000</td> <th>41</th> <td>110000</td> </tr>
        <tr> <th>8</th>   <td>350</td>    <th>25</th> <td>25000</td> <th>42</th> <td>118000</td> </tr>
        <tr> <th>9</th>   <td>450</td>    <th>26</th> <td>29000</td> <th>43</th> <td>126000</td> </tr>
        <tr> <th>10</th>  <td>500</td>    <th>27</th> <td>34000</td> <th>44</th> <td>134000</td> </tr>
        <tr> <th>11</th>  <td>800</td>    <th>28</th> <td>39000</td> <th>45</th> <td>142000</td> </tr>
        <tr> <th>12</th>  <td>1200</td>   <th>29</th> <td>43000</td> <th>46</th> <td>150000</td> </tr>
        <tr> <th>13</th>  <td>1600</td>   <th>30</th> <td>47000</td> <th>47</th> <td>160000</td> </tr>
        <tr> <th>14</th>  <td>2000</td>   <th>31</th> <td>52000</td> <th>48</th> <td>170000</td> </tr>
        <tr> <th>15</th>  <td>2500</td>   <th>32</th> <td>57000</td> <th>49</th> <td>180000</td> </tr>
        <tr> <th>16</th>  <td>3500</td>   <th>33</th> <td>62000</td> <th>50</th> <td>200000</td> </tr>
        <tr> <th>17</th>  <td>4500</td>   <th>34</th> <td>67000</td> <th>&nbsp;</th>   <td>&nbsp;</td> </tr>
      </table>

    </div>
  </div>



</div>
</section>


<jsp:include page="/jsp/include/foot.jsp"></jsp:include>

</body>
</html>