package yiqing;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class proServlet
 */
@WebServlet("/proServlet")
public class proServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public proServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        if(method.equals("d")) {
            try {
                d(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            }else if(method.equals("city")) {
                try {
                    city(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
	}
		/**
	     * @param request
	     * @param response
	     */
	    private void d(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
	        // TODO Auto-generated method stub
	        String province = request.getParameter("province");
	        String time = "2020-02-12 10:14:15";
	        List<information> list = dao.searchPro(time,province);
	        List<province> data = new ArrayList<province>();
	        for(int i=1; i<list.size();i++) {
	            province city = new province();
	            city.setName(list.get(i).getCity());
	            city.setValue(list.get(i).getConfirmed_num());
	            data.add(city);
	        }
	        Gson gson = new Gson();
	        String json = gson.toJson(data);
	        System.out.println(json);
	        response.getWriter().write(json);
	    }

	    /**
	     * @param request
	     * @param response
	     */
	    private void city(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
	        // TODO Auto-generated method stub
	        String province = request.getParameter("province");
	        String time = "2020-02-12 10:14:15";
	        List<information> list = dao.searchPro(time,province);
	        List<province> data = new ArrayList<province>();
	        for(int i=1; i<list.size();i++) {
	        	province city = new province();
	            city.setName(list.get(i).getCity());
	            city.setValue(list.get(i).getConfirmed_num());
	            data.add(city);
	        }
	        Gson gson = new Gson();
	        String json = gson.toJson(data);
	        System.out.println(json);
	        request.setAttribute("list", json);
	        request.setAttribute("province", province);
	        request.getRequestDispatcher("province_map.jsp").forward(request, response);
	    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
