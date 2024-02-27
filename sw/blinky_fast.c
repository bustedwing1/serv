
volatile int *gpio_addr = (int *)0x40000000;
int i = 0;
// int ii = 0;

int main()
{
  while (1) {
    *gpio_addr = i++;
    // for(ii=0;ii<100;ii++);
  }
  return 0;
}
