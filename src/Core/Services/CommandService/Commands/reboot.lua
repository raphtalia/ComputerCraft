return {
    Help = "",
    Flags = {},
    Handle = function()
        print("\n[Exit] Rebooting")
        sleep(0.2)
        os.reboot()
    end
}