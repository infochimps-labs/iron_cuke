# Ironcuke
No-hassle infrastructure testing

You use Chef to orchestrate your infrastructure. You have hundreds of lines of Chef code lying about in cookbooks, untested.

What if you could be sure that your cookbooks had the desired effect? What if you could test that code?

Ironcuke tests your cookbooks by spinning up VMs and running chef-client. Then it takes Silverware announcements from those VMs and generates cucumber tests, allowing you to ensure that your cookbooks had the desired effects.
