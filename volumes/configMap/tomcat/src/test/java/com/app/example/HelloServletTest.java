package com.app.example;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class HelloServletTest {

    @Test
    void testDoGet() throws Exception {
        // Mock HttpServletRequest and HttpServletResponse
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        // Capture response output
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);

        // Create instance of servlet and call doGet
        HelloServlet servlet = new HelloServlet();
        servlet.doGet(request, response);

        // Verify the response output
        writer.flush();
        assertEquals("Hello from Servlet!", stringWriter.toString().trim());
    }
}
