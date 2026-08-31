import cds, { Request } from "@sap/cds";
import { NextFunction, Response } from "express";

cds.on("bootstrap", async (app: any) => {
  // initialize
  app.use(async (req: Request, res: Response, next: NextFunction) => {
    //initialize middleware
    next();
  });
});

export default cds.server;
