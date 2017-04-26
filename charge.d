import std.exception;
import std.regex;
import std.stdio;

void main()
{
	File af;
	af.popen("acpi");
	const string acpi = af.readln();
	auto ctr = ctRegex!(`(Charging|Discharging|Full|Unknown), (\d+%)(?:, (\d+):(\d+):\d+)?`);
	auto caps = matchAll(acpi, ctr).captures();
	string lineout = caps[1][0] ~ " " ~ caps[2];
	if (caps[3].length && caps[4].length)
		lineout ~= " " ~ caps[3] ~ "h " ~ caps[4] ~ "m";
	writeln(lineout);
}
