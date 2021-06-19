return {
    Help = "",
    Flags = {},
    Handle = function()
        print("\n[Exit] Shutting down")
        sleep(0.2)
        os.shutdown()
    end
}