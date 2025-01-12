const std = @import("std");
const rl = @import("raylib");

const sw = 640;
const sh = 360;

const cornflowerblue = rl.Color.init(0x64, 0x95, 0xed, 0xff);

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Starting Raylib with Zig...\n", .{});

	rl.initWindow(sw, sh, "raylib-zig");
	rl.setTargetFPS(60);

	while (!rl.windowShouldClose()) {
		rl.beginDrawing();
		rl.clearBackground(cornflowerblue);
		rl.drawText("Hello Raylib ++ Zig!", 20, sh - 100, 36, rl.Color.ray_white);
		rl.endDrawing();
	}

	rl.closeWindow();
}
