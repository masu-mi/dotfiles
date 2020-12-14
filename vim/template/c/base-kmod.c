#include <linux/module.h>

MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("NAO <n.chika156@gmail.com>");
MODULE_INFO(free_form_info, "You can write the string here freely.");
MODULE_DESCRIPTION("This moduel is for testing");

static int __init debimate_init(void)
{
	printk(KERN_INFO "Hello, World!\n");
	return 0;
}

static void __exit debimate_exit(void)
{
	printk(KERN_INFO "Goodbye.\n");
}

module_init(debimate_init);
module_exit(debimate_exit);
