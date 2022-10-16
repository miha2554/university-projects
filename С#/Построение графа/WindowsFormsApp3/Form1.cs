using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Tao.FreeGlut;
using Tao.OpenGl;
using Tao.Platform.Windows;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            AnT.InitializeContexts();
        }

        void Draw()
        {
            Gl.glClear(Gl.GL_COLOR_BUFFER_BIT);
            /*Gl.glColor3f(0.0f, 1.0f, 0.8f);
            GraphV(3.0, 3.0, 1.0);
            Gl.glColor3f(0.0f, 1.0f, 0.8f);
            GraphV(-3.0, -5.0, 2.0);

            Gl.glColor3f(0.3f, 0.3f, 0.3f);
            GraphE(3.5, 4.0, -3.0, -5.0, 2.0);*/

            //Triangle1();
            //Triangle2(r, g, b);
            //Triangle3(r, g, b);

            double[,] V = { { -6.0, 0.0 }, {-6.0, 5.0 }, {-3.0, 5.0 }, {-3.0, 0.0 },
                            {-1.0, 0.0 }, {0.0, 2.5 }, {1.0, 5.0}, {2.0, 2.5 }, {3.0, 0.0 } };

            double[,] E = { { 0.0, 1.0, 0.0, 1.0, 0.0, 1.0 , 0.0, 0.0, 0.0 },
                            { 0.0, 0.0, 3.0, 0.0, 3.0, 0.0 , 0.0, 0.0, 0.0 },
                            { 0.0, 0.0, 0.0, 4.0, 0.0, 0.0 , 4.0, 0.0, 0.0 },
                            { 0.0, 0.0, 0.0, 0.0, 1.0, 0.0 , 0.0, 0.0, 0.0 },
                            { 0.0, 0.0, 0.0, 0.0, 0.0, 3.0 , 0.0, 0.0, 2.0 },
                            { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 , 4.0, 0.0, 4.0 },
                            { 2.0, 0.0, 0.0, 0.0, 0.0, 0.0 , 0.0, 1.0, 0.0 },
                            { 0.0, 0.0, 0.0, 0.0, 0.0, 3.0 , 0.0, 0.0, 3.0 },
                            { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 , 0.0, 0.0, 0.0 },
                          };
            for(int i = 0; i < V.GetLength(0); i++)
            {
                Gl.glColor3f(0.7f, 0.6f, 0.9f);
                GraphV(V[i, 0], V[i, 1], 0.3);
            }

            for(int i = 0; i < V.GetLength(0); i++)
            {
                for(int j = 0; j < V.GetLength(0); j++)
                {
                    if (E[i, j] > 0) GraphE(V[i, 0], V[i, 1], V[j, 0], V[j, 1], 0.3);
                }
            }

            AnT.Invalidate();
        }

        double q, phi;
        private void Form1_Load(object sender, EventArgs e)
        {
            Glut.glutInit();
            Glut.glutInitDisplayMode(Glut.GLUT_RGBA | Glut.GLUT_DOUBLE);

            Gl.glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

            Gl.glMatrixMode(Gl.GL_PROJECTION);
            Gl.glLoadIdentity();
            Glu.gluOrtho2D(-10.0, 10.0, -10.0, 10.0);

            Gl.glMatrixMode(Gl.GL_MODELVIEW);
            Gl.glLoadIdentity();

            q = 0.6;
            phi = Math.PI / 12;
        }
        
        //вершина графа  - закрашенный круг с границей
        void GraphV(double x0, double y0, double r)
        {
            Gl.glBegin(Gl.GL_POLYGON);
            for (double t = 0.0; t < 2 * Math.PI; t += Math.PI / 90)
            {
                Gl.glVertex2d(x0 + r * Math.Cos(t), y0 + r * Math.Sin(t));
            }
            Gl.glEnd();

            Gl.glColor3f(0.0f, 0.0f, 0.0f);
            Gl.glLineWidth(2.0f);
            Gl.glBegin(Gl.GL_LINE_LOOP);
            for (double t = 0.0; t < 2 * Math.PI; t += Math.PI / 90)
            {
                Gl.glVertex2d(x0 + r * Math.Cos(t), y0 + r * Math.Sin(t));
            }
            Gl.glEnd();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Draw();
        }

        private void AnT_Load(object sender, EventArgs e)
        {

        }

        //дуги графа, т.е. векторы между границами кругов
        void GraphE(double x0, double y0, double x1, double y1, double r)
        {
            double r1 = Math.Sqrt((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0));
            if (r1 - 2 * r > 0)
            {
                double gamma;
                if (y1 - y0 >= 0)
                    gamma = Math.Acos((x1 - x0) / r1);
                else
                    gamma = 2 * Math.PI - Math.Acos((x1 - x0) / r1);

                //отрезок м-у границами кругов, от xi до dzeta
                double xi1, xi2, dzeta1, dzeta2;
                xi1 = x0 + r * Math.Cos(gamma);
                xi2 = y0 + r * Math.Sin(gamma);
                dzeta1 = x1 - r * Math.Cos(gamma);
                dzeta2 = y1 - r * Math.Sin(gamma);

                //координаты основания стрелки (треугольника)
                double v1, v2, v3, v4;
                v1 = dzeta1 - q * Math.Cos(gamma - phi);
                v2 = dzeta2 - q * Math.Sin(gamma - phi);
                v3 = dzeta1 - q * Math.Cos(gamma + phi);
                v4 = dzeta2 - q * Math.Sin(gamma + phi);

                Gl.glBegin(Gl.GL_LINES);
                Gl.glVertex2d(xi1, xi2);
                Gl.glVertex2d(dzeta1, dzeta2);
                Gl.glEnd();

                Gl.glBegin(Gl.GL_TRIANGLES);
                Gl.glVertex2d(dzeta1, dzeta2);
                Gl.glVertex2d(v1, v2);
                Gl.glVertex2d(v3, v4);
                Gl.glEnd();
                
            }
        }
    }
}
