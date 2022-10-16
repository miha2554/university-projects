#include <iostream>
#include <cmath>
using namespace std;

const int n=10;

typedef float real;
//real A[n][n];

struct TWOD
{
    int nrows, ncols;
    real**vals;
};

typedef struct TWOD twod;

real dot(int n, real a[], real b[]){
  real ab=0;
  for(int i=0;i<n;i++){
    ab+=a[i]*b[i];
  }
  return ab;
}


void MxV(twod A, real b[], real c[])
{
  for(int i=0; i<A.nrows; i++){
   real tmp = 0;
    for(int j=0; j<A.ncols; j++){
      tmp += A.vals[i][j]*b[j];
    }
      c[i] = tmp;
  }
}

void CrSymA(twod A){
   for(int i=0; i<A.nrows; i++){
    for(int j=i; j<A.ncols; j++){
        A.vals[i][j] = A.vals[j][i] = (A.ncols*i+j)*1.01;
    }
  }
}


void CG(twod A, real b[], real epsilon, real x[])
{
	int i, k, kmax = 3 * n;
	real *r, *p, *q;
	r=new real[n];
    p=new real[n];
    q=new real[n];
	real bb, rr, rr1, qp, alpha, beta;
	for (i = 0; i<A.nrows; i++) {
        x[i] = 0;
        r[i] = -b[i];
        p[i] = r[i];
	}
	bb = dot(n, b, b);
	rr = dot(n, r, r);
	for (k = 0; k<kmax; k++)
	{
		MxV(A, p, q);
		qp = dot(n, q, p);
		alpha = rr / (qp);
		for (i = 0; i<A.nrows; i++) x[i] = x[i] - alpha*p[i];
		for (i = 0; i<A.nrows; i++) r[i] = r[i] - alpha*q[i];


		rr1 = dot(n, r, r);
		if (sqrt(rr1 / bb)<epsilon){
			break;
		}
		beta = rr1 / rr;
		rr = rr1;

		for (i = 0; i<A.nrows; i++)
			p[i] = r[i] + beta*p[i];
	}
}

 void NewA(twod *A)
{
    A->vals = new real*[A->nrows];
    for (int i=0; i<A->ncols; i++)
        A->vals[i]=new real[A->ncols];
}


void DeleteA(twod *A)
{
    for (int i=0; i<A->nrows; i++)
        delete[] A->vals[i];
    delete A->vals;
}

void FillArray(real a[],real b[])
{
  int i,j;
  for(int i=0; i<n; i++)
  {
    a[i] = 0.1*i;
    b[i] = 1.1*i;
  }
}

void Sym(twod A)
{
    int i,j;
    for (i = 0; i<A.nrows; i++)
    {
        for (j = i; j<A.ncols; j++)
            A.vals[i][j] = A.vals[j][i] = n*i + j;
    }
}


void Pos(twod A)
{
    int i,j;
    A.vals[0][0] = 1e-2;
	for (i = 0; i<A.nrows; i++)
	{
		real tmp = 0;
		for (j = 0; j<A.ncols; j++)
		{
			if (i != j) tmp += abs(A.vals[i][j]);
		}
		A.vals[i][i] += tmp;
	}
}

void OutPut(twod A)
{
    int i,j;
    for (i = 0; i<A.nrows; i++)
	{
        for (j = 0; j<A.ncols; j++) cout<<A.vals[i][j]<<" ";
			cout<<"\n";
	}
}

void OutPutX(real x[])
{
    int i,j;
    for (i = 0; i<n; i++)
    {
        cout<<" "<<x[i];
    }
}

void OutPutB(real b[])
{
    int i,j;
    for (i = 0; i<n; i++)
    {
		cout<<" "<<b[i];
    }
}

int main() {
    twod A;
    A.nrows = A.ncols = n;
  real epsilon = 1e-8;
  real a[n] , b[n], x[n];
  int i,j;

    NewA(&A);

    FillArray(a,b);

    Sym(A);

    Pos(A);

    OutPut(A);

	for (i = 0; i<n; i++)
		x[i] = 1+i;

    cout<<endl;

	MxV(A, x, b);

    OutPutX(x);

    cout<<endl;
    cout<<endl;

    OutPutB(b);

    cout<<"\n";

    CG(A, b, epsilon, x);

  cout<<"\n"<<"dot="<<dot(n,a,b)<<endl;

  DeleteA(&A);

  return 0;
}