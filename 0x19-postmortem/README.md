# Postmortem: When the Database Took a Coffee Break ☕
> By Keshiro Monisola

![](https://t3.ftcdn.net/jpg/04/92/09/72/240_F_492097246_yagE8x9Uk8M9IekPy7GBuE0x1Uoa7esD.jpg)



## Issue Summary
![](https://www.cienotes.com/wp-content/uploads/2019/07/summaryblackboard.jpg)

Duration: August 25, 2023, 14:00 - August 25, 2023, 16:30 (WAT)
Impact: Web application experienced intermittent slowdowns and increased latency. Approximately 25% of users were affected during the peak of the incident. Users wondered if our servers were on a coffee break.


## Timeline (all time in GMT + 3)
![](https://www.ncbar.org/wp-content/uploads/2022/02/Timeline-Visual-300x145.png)

| Time (GMT + 3) | Actions |
| -------------- | -------- |
| 10:45 AM | Upgrades implementation begins |
| 11:00AM | Server Outage begins |
| 11:00AM | Pagers alerted on-call team |
| 11:10AM | On-call team acknowledgement |
| 11:15AM | Rollback initiation begins |
| 11:20AM | Successful rollback|
| 11:20AM | Server restart initiated|
| 11:25AM | 100% of traffic back online |

## Root cause
![](https://blog.systemsengineering.com/hs-fs/hubfs/blog-files/Root%20Cause.jpg?width=600&name=Root%20Cause.jpg)

The root cause of the issue was a misconfigured database connection pool size. The connection pool was set to a lower value than required to handle the incoming traffic. As a result, the pool became exhausted, leading to slow query execution times and increased latency for users.

## Preventive measures
![](https://cdn-ccchn.nitrocdn.com/eoxXytShChgscESECFYcqdYPaOaOGMwn/assets/images/optimized/rev-fbc0c0e/wp-content/uploads/2021/06/prevent-incidents.png)

-Configuration Review: Conduct a thorough review of all system configurations to identify and address any misconfigured settings.
-Monitoring Enhancement: Implement proactive monitoring on database connection pool metrics to detect pool exhaustion and prevent similar incidents in the future.
-Load Testing: Regularly perform load testing to ensure that system resources, including database connection pools, can handle anticipated traffic loads.
-Automated Scaling: Implement automated scaling mechanisms to dynamically adjust resource allocation based on traffic patterns.
-Documentation Update: Maintain up-to-date documentation regarding configuration settings and their impact on system performance.
