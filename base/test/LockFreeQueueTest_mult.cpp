

#include <thread>
#include "../src/lockfree_queue/lockFreeQueue.h"

//#define USE_LOCK

using namespace base;
class Test
{
public:
   Test(int id = 0, int value = 0)
   {
    this->id = id;
        this->value = value;
    sprintf(data, "id = %d, value = %d\n", this->id, this->value);
   }
   void display()
   {
    printf("%s", data);
   }
private:
   int id;
   int value;
   char data[128];
};

double getdetlatimeofday(struct timeval *begin, struct timeval *end)
{
    return (end->tv_sec + end->tv_usec * 1.0 / 1000000) -
           (begin->tv_sec + begin->tv_usec * 1.0 / 1000000);
}

lockFreeQueue<Test> queue(1 << 10, "/shm");

#define N ((1 << 20))

void produce()
{
    struct timeval begin, end;
    gettimeofday(&begin, NULL);
    unsigned int i = 0;
    while(i < N)
    {
        if(queue.push(Test(i >> 10, i)))
        i++;
    }
    gettimeofday(&end, NULL);
    double tm = getdetlatimeofday(&begin, &end);
    printf("producer tid=%lu %f MB/s %f msg/s elapsed= %f size= %u\n", pthread_self(), N * sizeof(Test) * 1.0 / (tm * 1024 * 1024), N * 1.0 / tm, tm, i);
}

void consume()
{
    Test test;
    struct timeval begin, end;
    gettimeofday(&begin, NULL);
    unsigned int i = 0;
    while(i < N)
    {
        if(queue.pop(test))
    {
       //test.display();
       i++;
    }
    }
    gettimeofday(&end, NULL);
    double tm = getdetlatimeofday(&begin, &end);
    printf("consumer tid=%lu %f MB/s %f msg/s elapsed= %f size= %u\n", pthread_self(), N * sizeof(Test) * 1.0 / (tm * 1024 * 1024), N * 1.0 / tm, tm, i);
}

int main(int argc, char const *argv[])
{
    std::thread producer1(produce);
    std::thread producer2(produce);
    std::thread consumer(consume);
    std::thread consumer2(consume);
    producer1.join();
    producer2.join();
    consumer.join();
    consumer2.join();

    return 0;
}