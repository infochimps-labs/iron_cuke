# Ironcuke - Coming Soon
No-hassle testing for your infrastructure

You use Chef to orchestrate your infrastructure. You have hundreds of lines of Chef code lying about in cookbooks, untested.

What if you could be sure that your cookbooks had the desired effect? What if you could test that code?

Ironcuke tests your Chef code by provisioning VMs with your cookbooks. Then, it tests that the cookbooks had the desired effects by generating Cucumber tests from Silverware announcements and running them on the VMs. All you have to do is include Silverware announcments in your cookbooks, and everything else is handled for you.
