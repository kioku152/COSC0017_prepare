
;; Function FB (FB, funcdef_no=0, decl_uid=2348, cgraph_uid=1, symbol_order=0)

void FB (int * t, int * b, int * a, int * i)
{
  _1 = *b;
  *t = _1;
  _2 = *a;
  _3 = *b;
  _4 = _2 + _3;
  *b = _4;
  _5 = *b;
  printf ("%d\n", _5);
  _6 = *t;
  *a = _6;
  _7 = *i;
  _8 = _7 + 1;
  *i = _8;
  goto <D.2361>;
  <D.2361>:
  return;
}



;; Function main (main, funcdef_no=1, decl_uid=2350, cgraph_uid=2, symbol_order=1)

int main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.2364;

  a = 0;
  b = 1;
  i = 1;
  scanf ("%d", &n);
  a.0_1 = a;
  printf ("%d\n", a.0_1);
  b.1_2 = b;
  printf ("%d\n", b.1_2);
  a.2_3 = a;
  if (a.2_3 < 0) goto <D.2362>; else goto <D.2363>;
  <D.2362>:
  printf ("error");
  <D.2363>:
  goto <D.2358>;
  <D.2359>:
  FB (&t, &b, &a, &i);
  <D.2358>:
  i.3_4 = i;
  n.4_5 = n;
  if (i.3_4 < n.4_5) goto <D.2359>; else goto <D.2357>;
  <D.2357>:
  a = {CLOBBER};
  b = {CLOBBER};
  i = {CLOBBER};
  t = {CLOBBER};
  n = {CLOBBER};
  D.2364 = 0;
  goto <D.2365>;
  <D.2365>:
  return D.2364;
}


