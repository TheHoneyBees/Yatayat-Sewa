<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.DummyDB"%>
<%
	DummyDB db = new DummyDB();
        System.out.println("getttttttttdat================");
	String name = request.getParameter("q");
	List<String> locations = db.searchDepartLocation(name);
         System.out.println("receiveddatttta================");
	Iterator<String> iterator = locations.iterator();
	while(iterator.hasNext()) {
		String location = (String)iterator.next();
                System.out.println(location);
		out.println(location);
	}
%>