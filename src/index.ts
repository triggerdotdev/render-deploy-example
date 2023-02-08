import { Trigger, customEvent } from "@trigger.dev/sdk";
import { z } from "zod";

new Trigger({
  id: "render-example",
  name: "Render Example",
  on: customEvent({
    name: "render.example",
    schema: z.object({ foo: z.string() }),
  }),
  async run(event, ctx) {
    await ctx.logger.info("Hello world from inside render");

    return event;
  },
}).listen();
