# Postmortem: When the Database Took a Coffee Break ☕
> By Keshiro Monisola


## Issue Summary

Duration: August 25, 2023, 14:00 - August 25, 2023, 16:30 (WAT)
Impact: Web application experienced intermittent slowdowns and increased latency. Approximately 25% of users were affected during the peak of the incident. Users wondered if our servers were on a coffee break.


## Timeline (all time in GMT + 1)

| Time (GMT + 1) | Actions |
| -------------- | -------- |
| 14:00  | The issue was initially detected when the monitoring system triggered an alert for elevated response times. |
| 14:05 | The engineering team began investigating the issue, suspecting a potential database performance problem. |
| 14:15 | Preliminary investigation revealed a high number of open database connections and slow query execution times. |
| 14:30 | The assumption was made that a sudden increase in traffic might be causing the database overload. |
| 14:45 |  Attempts were made to scale the database resources, but no significant improvement was observed. |
| 15:00 | The incident was escalated to the database administration team for further analysis. |
| 15:15 | Deep dive analysis revealed that the connection pool size was set to a lower value than required for the current traffic load.|
| 15:30 | Adjusted connection pool size settings to match traffic demands and restarted the application servers. |
| 15:45 | Response times started to improve as the adjusted connection pool size alleviated the database load. |
| 16:00 | The incident was declared resolved, with response times returning to normal levels. |
| 16:30 | Post-incident analysis and corrective measures discussion took place. |

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
