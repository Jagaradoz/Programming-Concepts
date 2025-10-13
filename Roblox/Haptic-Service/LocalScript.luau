local hapticService = game:GetService("HapticService")
local gamepad = Enum.UserInputType.Gamepad1

-- Methods
    -- IsVibrationSupported(inputType: Enum.UserInputType)                                          : Checks if the specified input type supports any haptic vibration.
    -- IsMotorSupported(inputType: Enum.UserInputType, motor: Enum.VibrationMotor)                  : Checks if a specific motor is supported on the given input type.
    -- SetMotor(inputType: Enum.UserInputType, motor: Enum.VibrationMotor, intensity: number(0-1))  : Sets the vibration intensity of a specific motor on an input device.
    -- GetMotor(inputType: Enum.UserInputType, motor: Enum.VibrationMotor)                          : Returns a tuple of numbers representing the current vibration intensity of a specific motor.
hapticService:IsVibrationSupported(Enum.UserInputType.Gamepad1)
hapticService:IsMotorSupported(gamepad, Enum.VibrationMotor.Small)
hapticService:SetMotor(gamepad, Enum.VibrationMotor.Large, 1)
hapticService:GetMotor(gamepad, Enum.VibrationMotor.Small)

-- Example:
if hapticService:IsVibrationSupported(gamepad) then
    if hapticService:IsMotorSupported(gamepad, Enum.VibrationMotor.Large) then
        print("Vibrating large motor at 75% intensity for 1 second...")
        hapticService:SetMotor(gamepad, Enum.VibrationMotor.Large, 0.75)
        task.wait(1)
        hapticService:SetMotor(gamepad, Enum.VibrationMotor.Large, 0) -- Always set back to 0 to stop
        print("Vibration stopped.")
    end
end