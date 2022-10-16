/*
 * Created by SharpDevelop.
 * User: user
 * Date: 24.02.2022
 * Time: 13:20
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using Tao.FreeGlut;
using Tao.OpenGl;
using Tao.Platform.Windows;

namespace Hausdorf
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class MainForm : Form
	{
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			AnT.InitializeContexts();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		void MainForm_Load(object sender, EventArgs e)
		{
			// TODO: Implement MainForm_Load
			 Glut.glutInit();
			Glut.glutInitDisplayMode(Glut.GLUT_RGBA|Glut.GLUT_DOUBLE);
			Gl.glClearColor(0.0f, 0.0f, 0.0f, 1.0f); //очистка экрана
			Gl.glMatrixMode(Gl.GL_PROJECTION);
			Gl.glLoadIdentity();
			Glu.gluOrtho2D(-10.0,10.0,-10.0,10.0); //матрица проекций
			Gl.glMatrixMode(Gl.GL_MODELVIEW);
			Gl.glLoadIdentity();
		}
		
		double eps;
		
		void Coords()
		{
			Gl.glBegin(Gl.GL_LINES);
			
			Gl.glColor3f(0.4f, 0.4f, 0.4f);
			for(double q=-10.0; q<=10.0; q++)
			{
				Gl.glVertex2d(q,-10.0);
				Gl.glVertex2d(q,10.0);
				Gl.glVertex2d(-10.0,q);
				Gl.glVertex2d(10.0,q);
			}
			
			Gl.glColor3f(0.4f, 0.4f, 0.4f);
			Gl.glVertex2d(-10.0, 0.0);
			Gl.glVertex2d(10.0, 0.0);
			Gl.glVertex2d(0.0, 10.0);
			Gl.glVertex2d(0.0, -10.0);
			Gl.glEnd();

			
			Gl.glPointSize(5.0f);
			Gl.glBegin(Gl.GL_POINTS);
			Gl.glVertex2d(0.0, 0.0);
			Gl.glEnd();
		}
		
		//Точка с окресностью
		void Point(double x, double y, double r)
		{
			Gl.glColor3f(0.4f, 1.0f, 0.7f); 
			Gl.glPointSize(5.0f);
		   Gl.glBegin(Gl.GL_POINTS);
		   Gl.glVertex2d(x, y);
		   Gl.glEnd();
		   
		   Gl.glBegin(Gl.GL_LINE_LOOP);
		   for(double i = 0.0; i<=2*Math.PI; i+=Math.PI/100.0)
		   {
				Gl.glVertex2d(r*Math.Cos(i)+x, r*Math.Sin(i)+y);
		   }
		   Gl.glEnd();
		}
		
		//Окружность с окресностью
		void Circle(double x, double y, double rc, double r)
		{
			 
			Gl.glColor3f(1.0f, 0.0f, 0.0f); 
			Gl.glPointSize(5.0f);
		   Gl.glBegin(Gl.GL_POINTS);
		   Gl.glVertex2d(x, y);
		   Gl.glEnd();
			
			Gl.glBegin(Gl.GL_LINE_LOOP);
		   for(double i = 0.0; i<=2*Math.PI; i+=Math.PI/100.0)
		   {
			   Gl.glVertex2d(rc*Math.Cos(i)+x, rc*Math.Sin(i)+y);
		   }
		   Gl.glEnd();
		   
		   
		   Gl.glColor3f(0.4f, 1.0f, 0.5f); 
		   Gl.glBegin(Gl.GL_LINE_LOOP);
		   for(double i = 0.0; i<=2*Math.PI; i+=Math.PI/100.0)
		   {
				Gl.glVertex2d((r+rc)*Math.Cos(i)+x, (r+rc)*Math.Sin(i)+y);
		   }
		   Gl.glEnd();
		}
		
		//Отрезок с окресностью
		void Line(double x1, double y1, double x2, double y2, double r)
		{
			double phi = Math.Acos(Convert.ToDouble(x2-x1)/Math.Sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)));
			if(y2-y1<0) phi = 2*Math.PI - phi;
			
			Gl.glColor3f(1.0f, 0.0f, 0.0f);
			Gl.glBegin(Gl.GL_LINES);
			Gl.glVertex2d(x1,y1);
			Gl.glVertex2d(x2,y2);
			Gl.glEnd();
			Gl.glColor3f(1.0f, 1.0f, 0.0f);
			Gl.glBegin(Gl.GL_LINES);
			Gl.glVertex2d(x2+r*Math.Cos(phi-Math.PI/2),y2+r*Math.Sin(phi-Math.PI/2));
			Gl.glVertex2d(x2+r*Math.Cos(phi+Math.PI/2),y2+r*Math.Sin(phi+Math.PI/2));
			Gl.glVertex2d(x1+r*Math.Cos(phi+Math.PI/2),y1+r*Math.Sin(phi+Math.PI/2));
			Gl.glVertex2d(x1+r*Math.Cos(phi-Math.PI/2),y1+r*Math.Sin(phi-Math.PI/2));
			Gl.glEnd();
			
			Gl.glColor3f(1.0f, 1.0f, 0.0f);
			
			Gl.glBegin(Gl.GL_LINE_LOOP);
		   for(double i = phi - Math.PI/2 ; i<phi+Math.PI/2; i+=Math.PI/100.0)
		   {
				Gl.glVertex2d(x2 + r*Math.Cos(i), y2 + r*Math.Sin(i));
		   }
		   
		   Gl.glVertex2d(x2 + r*Math.Cos(phi + Math.PI/2), y2 + r*Math.Sin(phi + Math.PI/2));
		   
		   for(double i = Math.PI/2+phi; i<=phi + (3.0/2.0)*Math.PI ; i+=Math.PI/100.0)
		   {
				Gl.glVertex2d(x1 + r*Math.Cos(i),y1 + r*Math.Sin(i));
		   }
		   Gl.glEnd();
		
		}
		
		void Draw()
		{
			Gl.glClear(Gl.GL_COLOR_BUFFER_BIT);
			Coords();
			
			AnT.Invalidate();
		}
			
		void Timer1_Tick(object sender, EventArgs e)
		{
			// TODO: Implement Timer1_Tick
			eps = Convert.ToDouble(trackBar1.Value)/100.0;
			
			label1.Text = (eps).ToString();
			Draw();
			Point(-5.0,5.0,eps);
			Point(2.0,-4.0,eps);
			//Circle(3.0,3.0,1.0,eps);
			Line(-2.0,2.0,3.0,-2.0,eps);
		}
	}
}
